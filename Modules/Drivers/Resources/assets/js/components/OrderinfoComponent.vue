<template>
    <div>
        <div class="card bg-light" v-show="acl.showOrdersStatics">
            <div class="card-header text-primary">
                {{ local[lang+".orders"]["ordersstatics"] }}
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
                        <i class="fas fa-dollar-sign"></i>
                    </span>

                    <div class="info-box-content">
                        <a href="drivers/orders/done">
                            <span class="info-box-text">+{{ local[lang+".orders"]["completedorders"] }}</span>
                        </a>

                        <span class="info-box-number">
                            {{orders.done}} <small>{{orders.doneSum}} <sup>{{ local[lang+".leads"]["usd"] }}</sup></small>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>

                <div class="info-box">
                    <span class="info-box-icon bg-info elevation-1">
                        <i class="fas fa-sync"></i>
                    </span>

                    <div class="info-box-content">
                        <a href="drivers/orders/progress">
                            <span class="info-box-text">{{ local[lang+".orders"]["now"] }}</span>
                        </a>

                        <span class="info-box-number">
                            {{orders.progress}}
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>

                <div class="info-box">
                    <span class="info-box-icon bg-warning elevation-1">
                        <i class="far fa-window-close"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">
                            {{ local[lang+".orders"]["canceledbycustomer"] }}
                        </span>
                        <span class="info-box-number">
                            {{orders.canceledByUser}}
                            <small>
                                <a href="#" :title="local[lang+'.orders']['canceledbyapp']">
                                    {{orders.canceledByApp}}
                                </a>
                            </small>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>



                <div class="info-box">
                    <span class="info-box-icon bg-danger elevation-1">
                        <i class="far fa-calendar-times"></i>
                    </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ local[lang+".orders"]["bounce"] }}</span>
                        <span class="info-box-number">
                            {{orders.bounce}}
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <!-- /.card-body -->

        </div>

        <!-- /.row -->
    </div>
</template>

<script>
    import CONFIG from "../../../../../../resources/js/app";

    export default {
        name: "OrdersinfoComponent",
        props: ["auth","lang","acl"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                orders: {
                    "progress": 0,
                    "done": 0,
                    "orders": 0,
                    "canceledByUser": 0,
                    "canceledByApp": 0,
                    "bounce": 0,
                    "doneSum": 0
                },
                local: CONFIG.LANG,
                keywords: null,
                errors: [],

            };
        },
        created() {
            this.getDone();
            this.getProgress();
            this.getUcanceled();
            this.getAcanceled();
            this.getBounce();

        },

        methods: {
            getDone() {
                this.loading = true;
                const query=CONFIG.DB.collection('orders');
                query.where('status','==','3').onSnapshot(snap => {
                    this.orders.done=snap.size;
                    let total=0;
                    snap.forEach(doc => {
                        total = total + Number(doc.data().price);
                    });
                    this.orders.doneSum=parseInt(total);
                    this.loading = false;
                });
            },
            getProgress() {
                this.loading = true;
                const query=CONFIG.DB.collection('orders');
                query.where('status','in',[0,'1',1,'0']).onSnapshot(snap => {
                    this.orders.progress=snap.size;

                    this.loading = false;
                });
            },
            getUcanceled() {
                this.loading = true;
                const query=CONFIG.DB.collection('orders');
                query.where('status','==','7').onSnapshot(snap => {
                    this.orders.canceledByUser=snap.size;

                    this.loading = false;
                });
            },
            getAcanceled() {
                this.loading = true;
                const query=CONFIG.DB.collection('orders');
                query.where('status','==',2).onSnapshot(snap => {
                    this.orders.canceledByApp=snap.size;

                    this.loading = false;
                });
            },
            getBounce() {
                this.loading = true;
                const query=CONFIG.DB.collection('orders');
                query.where('status','==','6').onSnapshot(snap => {
                    this.orders.bounce=snap.size;

                    this.loading = false;
                });
            },
        }
    };
</script>

<style scoped>
</style>
