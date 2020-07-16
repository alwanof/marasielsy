<template>
    <div>
        <div class="row" v-show="acl.showDriversStatics">
            <div class="col-lg-3">
                <div class="info-box">
                    <span class="info-box-icon bg-success elevation-1">
                        <i class="fas fa-users"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["alldrivers"] }}<i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i></span>
                        <span class="info-box-number">
                            {{allDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <div class="col-lg-3">
                <div class="info-box">
                    <span class="info-box-icon bg-info elevation-1">
                        <i class="fas fa-motorcycle"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["motor"] }}<i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i></span>
                        <span class="info-box-number">
                            {{motorDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <div class="col-lg-3">
                <div class="info-box">
                    <span class="info-box-icon bg-warning elevation-1">
                        <i class="fas fa-taxi"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["taxi"] }}<i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i></span>
                        <span class="info-box-number">
                            {{taxiDriversSize}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <div class="col-lg-3">
                <div class="info-box">
                    <span class="info-box-icon bg-danger elevation-1">
                        <i class="far fa-pause-circle"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".leads"]["pending"] }}<i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i></span>
                        <span class="info-box-number">
                            {{pencount}}
		                </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import CONFIG from "../../../../../../resources/js/app";

    export default {
        name: "DriversInfohorComponent",
        props: ["pencount","auth","acl","lang"],
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
                                });
                                item.total=total;
                                let isExist = this.bestDrivers.find(o => o.id === doc.data().userID);
                                if(this.bestDrivers.length<limit){
                                    console.log(this.bestDrivers.length);
                                    if(!isExist){
                                        this.bestDrivers.push(item);

                                    }else{
                                        const index=this.bestDrivers.indexOf(isExist);
                                        this.bestDrivers.splice(index, 1);
                                        this.bestDrivers.push(item);


                                    }
                                }
                                this.bestDrivers.sort((a,b) => (b.total-a.total));
                                if(parseInt(this.bestDrivers[0].total)>this.max){
                                    this.max=parseInt(this.bestDrivers[0].total);
                                }

                            });
                    });

                });



            },
        }
    };
</script>

<style scoped>
</style>
