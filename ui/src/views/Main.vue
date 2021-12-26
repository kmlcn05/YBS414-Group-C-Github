<style scoped>

.addmargin {
    margin-top: 10px;
    margin-bottom: 10px;
}

.vue-logo-back {
    background-color: black;
}

</style>

<template>

<div id="app" class="container">
        <h2 class="d-flex justify-content-center">
            Employee Management Portal
        </h2>       
        <nav class="navbar navbar-expand-sm bg-light navbar-dark">
            <ul class="navbar-nav">
            <li class="nav-item m-1">
                <router-link class="btn btn-light btn-outline-primary"
                to="/department">Departments</router-link>
            </li>
            <li class="nav-item m-1">
                <router-link class="btn btn-light btn-outline-primary"
                to="/employee">Employees</router-link>
            </li>   
            </ul>
        </nav>
        <div class="">
        <img src="../assets/emp2.png" width="400px" height="200px">
        <h3 v-for="name in names" :key='name'>{{ name }}</h3> 
        </div>
        
        <router-view></router-view>
    </div>

</template>

<script>

// @ is an alias to /src
import Display from '@/components/Display.vue'
import axios from 'axios'

export default {
    name: 'customers',
    
    mounted() {
        axios({
            method: "GET",
            "url": "assets/samplejson/customerlist.json"
        }).then(response => {
            this.customerlist = response.data;
        }, error => {
            // eslint-disable-next-line
            console.error(error);
        });
    },
    data() {
        const variables={
        API_URL:"http://127.0.0.1:8000/",
        PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
        
        const element = 0;
        return {
            names:['Kemalcan Ceylan','Can Kayacı','Arda Demirel'],
            departments:[],
            employees:[],
            modalTitle:"",
            EmployeeId:0,
            EmployeeName:"",
            Department:"",
            DateOfJoining:"",
            PhotoFileName:"anonymous.png",
            PhotoPath:variables.PHOTO_URL
        }
    },
    
    components: {
        Display
    },
    methods: {
        refreshData(variables){
        
        console.log (variables);
        
        axios.get("http://127.0.0.1:8000/"+"employee")
        .then((response)=>{
            this.employees=response.data;
            
        });

        axios.get("http://127.0.0.1:8000/"+"department")
        .then((response)=>{
            this.departments=response.data;
        });
       
    },
        goToDetailsPage: function(id) {
            this.$router.push("/customerdetails/"+id);
        }
        
    },
    mounted:function(){
    const variables={
            API_URL:"http://127.0.0.1:8000/",
            PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
            const element = 0;
    this.refreshData(variables);
    
}
}

</script>
