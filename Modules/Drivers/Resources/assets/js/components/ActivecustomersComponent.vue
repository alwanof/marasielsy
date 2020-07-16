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

                        <th>{{ local[lang+".leads"]["name"] }}</th>
                        <th>{{ local[lang+".leads"]["email"] }}</th>
                        <th>{{ local[lang+".leads"]["mobile"] }}</th>

                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(customer, index) in customers" :key="customer.userID">

                        <td>{{customer.firstName}} {{customer.lastName}}</td>
                        <td>{{customer.email}}</td>
                        <td>{{customer.phone}}</td>

                        <td>
                            <button v-show="acl.addCredit2user" type="button" @click="addCredit(customer)"  class="btn btn-sm btn-dark" data-toggle="modal" data-target="#staticBackdrop">
                                {{ local[lang+".leads"]["addcredit"] }}
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr />

            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="creditDialog" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">
                            <i class="fas fa-cog fa-spin px-2 text-primary" v-show="loading"></i>Add Credit
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" v-model="customer && customer.userID">
                        <div class="input-group mt-3">
                            <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fas fa-dollar-sign"></i>
                  </span>
                            </div>
                            <input
                                type="number" min="0" step="1"
                                v-model="newCredit"
                                class="form-control"
                                placeholder="Enter Ammount.."
                                onkeypress="return isNumberKey(event)"
                                required
                            />
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" @click="doAddCredit"  class="btn btn-primary">Add Credit</button>
                    </div>
                </div>
            </div>
        </div>


    </div>


</template>

<script>
    import CONFIG from "../../../../../../resources/js/app";

    export default {
        name: "ActivecustomeresComponent",
        props: ["auth", "lang","acl"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                details:false,
                customers: [],
                customer:null,
                newCredit:0,
                total:0,
                local: CONFIG.LANG,
                keywords: null,
                errors: [],

            };
        },
        created() {
            this.getResults();



        },
        watch: {
            keywords(after, before) {
                if (this.keywords.length > 2 || this.keywords.length === 0) {
                    this.search();
                }
            }
        },

        methods: {
            getResults() {

                this.customers=[];
                this.loading = true;
                const pageSize=25;
                const query=CONFIG.DB.collection('users');
                query.orderBy('email').limit(pageSize).get()
                    .then(snap=>{
                        let total =0;
                        snap.forEach(doc=>{
                            if(doc.data().vehicle_type!=0 && doc.data().vehicle_type!=1){
                                if(total<pageSize){
                                    this.customers.push(doc.data());
                                    total++;
                                }

                            }
                        });

                        this.loading = false;
                        this.total=total;

                    });
            },
            search() {
                this.customers=[];
                this.loading = true;
                const pageSize=25;
                const query=CONFIG.DB.collection('users');
                query.orderBy('email')
                    .startAt(this.keywords).endAt(this.keywords+'\uf8ff')
                    .limit(pageSize).get()
                    .then(snap=>{
                        let total =0;
                        snap.forEach(doc=>{
                            if(doc.data().vehicle_type!=0 && doc.data().vehicle_type!=1){
                                if(total<pageSize){
                                    this.customers.push(doc.data());
                                    total++;
                                }

                            }
                        });

                        this.loading = false;
                        this.total=total;

                    });
            },
            addCredit(customer){
                this.customer=customer;
                $("#creditDialog").modal("show");
            },
            doAddCredit(){
                this.loading = true;
                var today = new Date();
                const query=CONFIG.DB.collection('users')
                    .doc(this.customer.userID).collection('transactions').doc(randomStr(18))
                    .set({
                        date: today,
                        desc:'Deposit',
                        type: "12",
                        value:this.newCredit
                    });
                this.loading = false;
                $("#creditDialog").modal("hide");
                toastr["success"]('Credit has been added','ok');


            },


        }
    };
</script>

<style scoped>
</style>
