<template>
    <div>
        <div class="card card-primary card-outline">
            <div class="card-header">

                <i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i>

                <div class="card-tools">

                    <div class="input-group input-group-sm">
                        <input
                            type="text"
                            name="table_search"
                            v-model="keywords"
                            class="form-control float-right"
                            :placeholder=" local[lang+'.users']['search'] "
                        />

                        <div class="input-group-append">
                            <button type="submit" class="btn btn-default">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body p-0 table-responsive">
                <table class="table table-striped table-hover table-head-fixed">
                    <thead>
                    <tr>

                        <th>{{ local[lang+".orders"]["customername"] }}</th>

                        <th>{{ local[lang+".orders"]["price"] }}</th>
                        <th>{{ local[lang+".orders"]["date"] }}</th>
                        <th>{{ local[lang+".orders"]["details"] }}</th>

                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(order, index) in orders" :key="order.orderID">

                        <td>{{order.customer}}</td>
                        <td>{{order.price}}</td>
                        <td>{{order.date}}</td>
                        <td>
                            <b>{{ local[lang+".orders"]["distance"] }}:</b> {{order.distance}}
                            <br>

                            <span v-show="details">
                                <b>{{ local[lang+".orders"]["from"] }}:</b> {{order.from}}<br>
                                <b>{{ local[lang+".orders"]["to"] }}:</b> {{order.to}}
                            </span>
                            <div>
                                <a href="#" @click="details=!details">...</a>
                            </div>
                        </td>
                        <td>
                            +++
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr />

            </div>
        </div>

    </div>

</template>

<script>
    import CONFIG from "../../../../../../resources/js/app";

    export default {
        name: "OrderprogressComponent",
        props: ["auth", "lang","acl"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                details:false,
                orders: [],
                total:0,
                local: CONFIG.LANG,
                keywords: null,
                errors: [],

            };
        },
        created() {
            this.getResults();
            if(5==5){
                axios
                    .get('http://localhost/marasielo/public/api/nullo')
                    .then(res => {
                        console.log('done');
                    });
            }



        },


        methods: {
            getResults() {

                this.orders=[];

                this.loading = true;
                const pageSize=25;
                const query=CONFIG.DB.collection('orders');
                query.where('status','in',[0,'1',1,'0']).limit(pageSize).get()
                    .then(snap=>{
                        let total =0;

                        snap.forEach(async doc=>{
                            let item={};
                            item.code=doc.data().code;
                            item.distance=doc.data().distance;
                            item.notes=doc.data().notes;
                            item.price=doc.data().price;
                            item.from=doc.data().from;
                            item.to=doc.data().to;
                            item.date=doc.data().order_date;
                            if(total<pageSize){

                                await CONFIG.DB.collection('users')
                                    .doc(doc.data().customer_uid).get()
                                    .then(user=>{
                                        item.customer=user.data().firstName+' '+user.data().lastName;
                                    });




                                this.orders.push(item);
                                total++;
                            }
                        });

                        this.loading = false;
                        this.total=total;

                    });
            },




        }
    };
</script>

<style scoped>
</style>
