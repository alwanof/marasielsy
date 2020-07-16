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
                        <th></th>
                        <th>{{ local[lang+".leads"]["name"] }}</th>
                        <th>{{ local[lang+".leads"]["email"] }}</th>
                        <th>{{ local[lang+".leads"]["mobile"] }}</th>
                        <th>{{ local[lang+".leads"]["details"] }}</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(driver, index) in drivers" :key="driver.userID">
                        <td><img :src="driver.profilePictureURL" class="rounded-circle" width="42"></td>
                        <td>{{driver.firstName}} {{driver.lastName}}</td>
                        <td>{{driver.email}}</td>
                        <td>{{driver.phone}}</td>
                        <td >
                            <b>{{ local[lang+".leads"]["vtype"] }}:</b> {{(driver.vehicle_type==0)?local[lang+".leads"]["vtypelist"][1]:local[lang+".leads"]["vtypelist"][0]}}
                            <br>

                            <span v-show="details">
                                <b>{{ local[lang+".leads"]["carmodel"] }}:</b> {{driver.vehicle_brand}}
                            </span>
                            <div>
                                <a href="#" @click="details=!details">...</a>
                            </div>
                        </td>
                        <td>

                            <button v-show="acl.addCredit2user" type="button" @click="addCredit(driver)"  class="btn btn-sm btn-dark" data-toggle="modal" data-target="#staticBackdrop">
                                {{ local[lang+".leads"]["addcredit"] }}
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr />
                <div class="p-2">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
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
                        <input type="hidden" v-model="driver && driver.userID">
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

    function randomStr(length) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
    export default {
        name: "ActiveComponent",
        props: ["auth", "lang","acl"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                details:false,
                drivers: [],
                driver:null,
                newCredit:0,
                local: CONFIG.LANG,
                keywords: null,
                errors: [],

            };
        },
        created() {
            this.getResults();

        },
        watch: {
            /*keywords(after, before) {
                if (this.keywords.length > 2 || this.keywords.length === 0) {
                    //this.search();
                }
            }*/
        },
        methods: {
            getResults() {

                this.loading = true;
                    const pageSize = 3;
                    const query=CONFIG.DB.collection('users');
                    query.where('vehicle_type','in',[0,1]).get()
                    .then(snap=>{
                        snap.forEach(doc=>{
                            this.drivers.push(doc.data());
                            this.loading = false;
                        });


                    });


            },
            search(page) {
                /*this.loading = true;
                if (typeof page === "undefined") {
                    page = 1;
                }*/

            },
            addCredit(driver){
              this.driver=driver;
                $("#creditDialog").modal("show");
            },
            doAddCredit(){
                this.loading = true;
                var today = new Date();
                const query=CONFIG.DB.collection('users')
                .doc(this.driver.userID).collection('transactions').doc(randomStr(18))
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


            clearFields() {
                //this.user.name = this.user.email =this.user.domain= this.user.password = null;
            }
        }
    };
</script>

<style scoped>
</style>
