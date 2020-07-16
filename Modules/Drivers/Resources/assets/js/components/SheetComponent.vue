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
                        <th>
                            <span class="badge badge-info">+{{drivers.total}}</span>
                        </th>
                        <th v-show="acl.makeDriversApproved"></th>
                        <th>{{ local[lang+".leads"]["fname"] }}</th>
                        <th>{{ local[lang+".leads"]["lname"] }}</th>
                        <th><i class="fas fa-info-circle"></i></th>
                        <th width="30%"><i class="fas fa-paperclip"></i></th>

                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(driver, index) in drivers.data" :key="driver.id">
                        <td width="15%" v-show="acl.makeDriversApproved">
                            <button type="button"  @click="active(index,driver)"  :class="'btn btn-sm '+((driver.active==1)?'btn-success':'btn-warning')+' approveBtn text-light'"  :disabled="(driver.active==1)?true:false">

                                {{ local[lang+".leads"]["approve"] }}

                            </button>

                        </td>
                        <td><img :src="driver.avatar" class="rounded-circle" width="42"></td>
                        <td>
                            {{ driver.fname }}
                        </td>
                        <td>{{driver.lname}}</td>
                        <td>
                            <span class="badge badge-secondary">{{driver.email}}</span>
                            <span class="badge badge-secondary">{{driver.phone}}</span>
                            <span class="badge badge-secondary">{{(driver.vtype=='0')?local[lang+".leads"]["vtypelist"][0]:local[lang+".leads"]["vtypelist"][0]
                            }}</span>
                            <span class="badge badge-secondary">{{driver.vmodel}}</span>
                            <span class="badge badge-secondary">{{driver.plateno}}</span>
                        </td>
                        <td>
                            <span v-for="attach in driver.attachs" >
                                <a :href="path+'/modules/drivers/uploads/attach/'+driver.email+'/'+attach" target="_blank">{{attach}}</a>
                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr />
                <div class="p-2">
                    <pagination :data="Object.assign({},drivers)" @pagination-change-page="getResults"></pagination>
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
        name: "SheetComponent",
        props: ["auth", "lang","acl"],
        data() {
            return {
                path: CONFIG.PATH,
                loading: false,
                drivers: [],
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
            getResults(page = 1) {
                this.loading = true;
                if (typeof page === "undefined") {
                    page = 1;
                }
                axios
                    .get(
                        CONFIG.API_URL +
                        "drivers/apigate/sheet?page=" +
                        page +
                        "&api_token=" +
                        this.auth.api_token
                    )
                    .then(res => {
                        this.drivers = res.data;
                        this.loading = false;
                    });
            },
            search(page) {
                this.loading = true;
                if (typeof page === "undefined") {
                    page = 1;
                }
                axios
                    .get(
                        CONFIG.API_URL +
                        "drivers/apigate/search/drivers?page=" +
                        page +
                        "&keywords=" +
                        this.keywords +
                        "&api_token=" +
                        this.auth.api_token
                    )
                    .then(res => {
                        this.drivers = res.data;
                        this.loading = false;
                    });
            },

            active(index,driver){
                this.loading = true;
                this.drivers.data[index].active=1;

                const data={
                    hash:driver.hash,
                    email:driver.email,
                    phone:driver.phone,
                    password:'secret+9314',
                    fname:driver.fname,
                    lname:driver.lname,
                    vmodel:driver.vmodel,
                    vtype:driver.vtype,
                    profile_URL:driver.avatar,
                    country:driver.country,

                }

                const user=CONFIG.dbAuth.createUserWithEmailAndPassword(driver.email,'secret+9314')
                .then(doc=>{
                    if(doc){
                        const query=CONFIG.DB.collection('users')
                            .doc(doc.user.uid)
                            .set({
                                'appIdentifier':'flutter-onboarding',
                                'email': driver.email,
                                'firstName': driver.fname,
                                'lastName': driver.lname,
                                'gender': '0',
                                'phone': parseInt(driver.phone),
                                'profilePictureURL': driver.avatar,
                                'userID': doc.user.uid,
                                'vehicle_brand': driver.vmodel,
                                'vehicle_type': parseInt(driver.vtype),
                                'country': driver.country
                            });
                        axios.get(CONFIG.API_URL + "drivers/apigate/set/"+ driver.id+ "/"+doc.user.uid+"/approved?api_token=" + this.auth.api_token)
                            .then((res) => {
                                if(res.data==1){

                                    toastr["success"]('Driver has been activated','ok');
                                    this.loading = false;
                                }else{
                                    console.log('unexpected error!!!');
                                    this.loading = false;
                                }

                            })
                            .catch(error => {
                                this.loading = false;
                                console.log(error);
                            });

                    }
                });






                //const query=CONFIG.DB.collection('feeds');
                /*axios
                    .get(
                        CONFIG.API_URL + "drivers/apigate/set/"+ driver.id+ "/approved?api_token=" + this.auth.api_token
                    )
                    .then((res) => {
                      if(res.data==1){

                          toastr["success"]('Driver has been activated','ok');
                          this.loading = false;
                      }else{
                          console.log('unexpected error!!!');
                          this.loading = false;
                      }

                    })
                    .catch(error => {
                        this.loading = false;
                        console.log(error);
                    });*/


            },

            clearFields() {
                //this.user.name = this.user.email =this.user.domain= this.user.password = null;
            }
        }
    };
</script>

<style scoped>
</style>
