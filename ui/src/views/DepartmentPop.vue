<template>
    
<div class="modal-dialog modal-lg modal-dialog-centered">
<div class="modal-content">
    <div class="modal-header">
        <h4>Add Department</h4>
        <h4 class="modal-title" id="exampleModalLabel">{{modalTitle}}</h4>
        <button type="button" @click="btnclose()" >X</button>
    </div>

    <div class="modal-body">

        <div class="input-group mb-3">
            <span class="input-group-text">Department Name</span>
            <input type="text" class="form-control" v-model="DepartmentName">
        </div>

        <button type="button" @click="createClick()"
        v-if="DepartmentId==0" class="btn btn-primary">
        Create
        </button>
        <button type="button" @click="updateClick()"
        v-if="DepartmentId!=0" class="btn btn-primary">
        Update
        </button>

    </div>

</div>
</div>
</div>

</template>

<script>
    import axios from 'axios';
    export default {
        name: 'Department',

        data(){
            const variables={
                    API_URL:"http://127.0.0.1:8000/",
                    PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
                    const element = 0;
            return{
                departments:[],
                modalTitle:"",
                DepartmentName:"",
                DepartmentId:0,
                DepartmentNameFilter:"",
                DepartmentIdFilter:"",
                departmentsWithoutFilter:[]
            }
},
methods:{
    
    refreshData(){
        axios.get("http://127.0.0.1:8000/"+"department")
        .then((response)=>{
            this.departments=response.data;
            this.departmentsWithoutFilter=response.data;
        });
    },
    btnclose(){
        this.$router.replace({ name: "department" });

    },
    addClick(){
        this.modalTitle="Add Department";
        this.DepartmentId=0;
        this.DepartmentName="";
    },
    editClick(dep){
        this.modalTitle="Edit Department";
        this.DepartmentId=dep.DepartmentId;
        this.DepartmentName=dep.DepartmentName;
    },
    createClick(){
        axios.post("http://127.0.0.1:8000/"+"department",{
            DepartmentName:this.DepartmentName
        })
        .then((response)=>{
            this.refreshData();
            alert(response.data);
            this.$router.replace({ name: "department" });
        });
    },
    updateClick(){
        axios.put("http://127.0.0.1:8000/"+"department",{
            DepartmentId:this.DepartmentId,
            DepartmentName:this.DepartmentName
        })
        .then((response)=>{
            this.refreshData();
            alert(response.data);
        });
    },
    deleteClick(id){
        if(!confirm("Are you sure?")){
            return;
        }
        axios.delete("http://127.0.0.1:8000/"+"department/"+id)
        .then((response)=>{
            this.refreshData();
            alert(response.data);
        });

    },
    FilterFn(){
        var DepartmentIdFilter=this.DepartmentIdFilter;
        var DepartmentNameFilter=this.DepartmentNameFilter;

        this.departments=this.departmentsWithoutFilter.filter(
            function(el){
                return el.DepartmentId.toString().toLowerCase().includes(
                    DepartmentIdFilter.toString().trim().toLowerCase()
                )&&
                el.DepartmentName.toString().toLowerCase().includes(
                    DepartmentNameFilter.toString().trim().toLowerCase()
                )
            });
    },
    sortResult(prop,asc){
        this.departments=this.departmentsWithoutFilter.sort(function(a,b){
            if(asc){
                return (a[prop]>b[prop])?1:((a[prop]<b[prop])?-1:0);
            }
            else{
                return (b[prop]>a[prop])?1:((b[prop]<a[prop])?-1:0);
            }
        })
    }

},
mounted:function(){
    const variables={
            API_URL:"http://127.0.0.1:8000/",
            PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
            const element = 0;
    this.refreshData(variables);
    
}

};

</script>

