<template>
    <div>
        <div class="card  bg-light" v-show="acl.showDriversStatics">
            <div class="card-header text-primary">
                {{ local[lang+".leads"]["driversstatics"] }}
                <i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fas fa-minus"></i></button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fas fa-times"></i></button>
                </div>
            </div>
            <div class="card-body p-2">
                <div class="info-box">
                    <span class="info-box-icon bg-success elevation-1">
                        <i class="fas fa-users"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["alldrivers"] }}</span>
                        <span class="info-box-number">
                            {{allDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>

                <div class="info-box">
                    <span class="info-box-icon bg-info elevation-1">
                        <i class="fas fa-motorcycle"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["motor"] }}</span>
                        <span class="info-box-number">
                            {{motorDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>

                <div class="info-box">
                    <span class="info-box-icon bg-warning elevation-1">
                        <i class="fas fa-taxi"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["taxi"] }}</span>
                        <span class="info-box-number">
                            {{taxiDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="info-box">
                    <span class="info-box-icon bg-danger elevation-1">
                        <i class="far fa-pause-circle"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["pending"] }}</span>
                        <span class="info-box-number">
                            {{pencount}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <!-- /.card-body -->

        </div>


        <div class="card " v-show="acl.showTopDrivers">
            <div class="card-header text-primary">

                {{ local[lang+".leads"]["topdrivers"] }}
                <i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fas fa-minus"></i></button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fas fa-times"></i></button>
                </div>
            </div>
            <div class="card-body p-2">
                <div class="progress-group" v-for="(driver, index) in bestDrivers" :key="driver.id">

                    <img :src="driver.avatar" class="rounded-circle m-1" width="24"> {{driver.fname}} {{driver.lname}}
                    <span class="float-right"><b>{{driver.total}}<small><sup>{{ local[lang+".leads"]["usd"] }}</sup></small></b>/{{driver.orders}}</span>
                    <div class="progress progress-sm mb-3">
                        <div :class="'progress-bar bg-'+getColor(100*driver.total/max)" :style="'width: '+(100*driver.total/max)+'%'"></div>
                    </div>
                </div>

            </div>
            <!-- /.card-body -->

        </div>


    </div>
</template>

<script>
    import CONFIG from "../../../../../../resources/js/app";

    export default {
        name: "DriversInfoComponent",
        props: ["pencount","acl","auth","lang"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                drivers: [],
                bestDrivers:[],
                max:0,
                min:0,
                allDriversSize:0,
                motorDriversSize:0,
                taxiDriversSize:0,
                local: CONFIG.LANG,
                keywords: null,
                errors: [],

            };
        },
        created() {
            this.getDriversSize();
            this.getMotorsSize();
            this.getTaxiSize();
            this.getBestDrivers();


        },
        mounted() {


        },

        methods: {
            getColor(v){
                const x=v;
                switch (true) {
                    case (x<20):
                        return 'danger';
                        break;
                    case (x<50):
                        return 'warning';
                        break;
                    case (x<70):
                        return 'primary';
                        break;
                    default:
                        return 'success';
                        break;

                }
            },
            getDriversSize() {
                this.loading = true;
                const query=CONFIG.DB.collection('users');
                query.where('vehicle_type','in',[0,1]).onSnapshot(snap => {
                    this.allDriversSize=snap.size;
                    this.loading = false;
                });

            },
            getMotorsSize() {
                this.loading = true;
                const query=CONFIG.DB.collection('users');
                query.where('vehicle_type','==',0).onSnapshot(snap => {
                    this.motorDriversSize=snap.size;
                    this.loading = false;
                });

            },
            getTaxiSize() {
                this.loading = true;
                const query=CONFIG.DB.collection('users');
                query.where('vehicle_type','==',1).onSnapshot(snap => {
                    this.taxiDriversSize=snap.size;
                    this.loading = false;
                });

            },
            getBestDrivers() {
                const limit=5;
                this.loading = true;
                const query=CONFIG.DB.collection('users');

                query.where('vehicle_type','in',[0,1]).onSnapshot(snap => {
                    snap.forEach(doc=>{

                        const orders= CONFIG.DB.collection('orders');
                        const subquery=orders.where('driver_uid','==',doc.data().userID)
                            .where('status','==','3')
                            .onSnapshot(subSnap=>{

                                let item={};
                                item.id=doc.data().userID;
                                item.fname=doc.data().firstName;
                                item.avatar=doc.data().profilePictureURL;
                                item.lname=doc.data().lastName;
                                item.orders=subSnap.size;
                                let total=0;
                                subSnap.forEach(o=>{

                                    total=parseInt(total+parseFloat(o.data().price));

                                    item.total=total;
                                    let isExist = this.bestDrivers.find(o => o.id === doc.data().userID);
                                    if(!isExist){
                                        this.bestDrivers.push(item);
                                    }else{
                                        const index=this.bestDrivers.indexOf(isExist);
                                        this.bestDrivers.splice(index, 1);
                                            this.bestDrivers.push(item);
                                    }


                                    this.bestDrivers.sort((a,b) => (b.total-a.total));

                                    if(parseInt(this.bestDrivers[0].total)>this.max){
                                        this.max=parseInt(this.bestDrivers[0].total);
                                    }
                                    this.bestDrivers=this.bestDrivers.slice(0,limit);
                                });



                            });
                    });

                });



            },
        }
    };
</script>

<style scoped>
</style>
