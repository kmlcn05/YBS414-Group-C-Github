<template>

<div class="modal-dialog modal-lg modal-dialog-centered">
<div class="modal-content">
    <div class="modal-header">
        <h4>Add Employee</h4>
        <h4 class="modal-title" id="exampleModalLabel">{{modalTitle}}</h4>
        <button type="button" @click="btnclose()" >X</button>
    </div>

    <div class="modal-body">
    <div class="d-flex flex-row bd-highlight mb-3">
        <div class="p-2 w-50 bd-highlight">
            <div class="input-group mb-3">
                <span class="input-group-text">Name</span>
                <input type="text" placeholder= "" class="form-control" v-model="EmployeeName">

            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">Department</span>
                <select class="form-select" v-model="Department">
                    <option v-for="dep in departments" >
                    {{dep.DepartmentName}}
                    </option>
                </select>
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text">DOJ</span>
                <input type="date" class="form-control" v-model="DateOfJoining">
            </div>

        </div>
        <div class="p-2 w-50 bd-highlight">
            <img width="250px" height="250px"
                :src="PhotoPath+PhotoFileName"/>
            <input class="m-2" type="file" @change="imageUpload">
        </div>
    </div>
        <button type="button" @click="createClick()"
        v-if="EmployeeId==0" class="btn btn-primary">
        Create
        </button>
        <button type="button" @click="updateClick()"
        v-if="EmployeeId!=0" class="btn btn-primary">
        Update
        </button>

    </div>

</div>
</div>

</template>

<script>
    import axios from 'axios';
    export default {
        name: 'Employeepop',
        
        

        data() {
            const variables={
            API_URL:"http://127.0.0.1:8000/",
            PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
            const element = 0;
            
            
            

            return {
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
        

    methods:{
    refreshData(){
        
        
        
        axios.get("http://127.0.0.1:8000/"+"employee")
        .then((response)=>{
            this.employees=response.data;
            
        });

        axios.get("http://127.0.0.1:8000/"+"department")
        .then((response)=>{
            this.departments=response.data;
        });
       
    },
    btnclose(){
        this.$router.replace({ name: "employee" });

    },
    
    addClick(){
        
        this.modalTitle="Add Employee";
        this.EmployeeId=0;
        this.EmployeeName="";
        this.Department="",
        this.DateOfJoining="",
        this.PhotoFileName="anonymous.png"
    },
    editClick(emp){
        this.modalTitle="Edit Employee";
        this.EmployeeId=emp.EmployeeId;
        this.EmployeeName=emp.EmployeeName;
        this.Department=emp.Department,
        this.DateOfJoining=emp.DateOfJoining,
        this.PhotoFileName=emp.PhotoFileName
    },
    createClick(){
        
        axios.post("http://127.0.0.1:8000/"+"employee",{
            EmployeeName:this.EmployeeName,
            Department:this.Department,
            DateOfJoining:this.DateOfJoining,
            PhotoFileName:this.PhotoFileName
        })
        .then((response)=>{
            this.refreshData();
            alert(response.data);
            this.$router.replace({ name: "employee" });
            
            
        });
    },
    updateClick(){
        axios.put("http://127.0.0.1:8000/"+"employee",{
            EmployeeId:this.EmployeeId,
            EmployeeName:this.EmployeeName,
            Department:this.Department,
            DateOfJoining:this.DateOfJoining,
            PhotoFileName:this.PhotoFileName
        })
        .then((response)=>{
            this.refreshData(variables);
            alert(response.data);
        });
    },
    deleteClick(id){
        if(!confirm("Are you sure?")){
            return;
        }
        axios.delete("http://127.0.0.1:8000/"+"employee/"+id)
        .then((response)=>{
            this.refreshData(variables);
            alert(response.data);
        });

    },
    imageUpload(event){
        let formData=new FormData();
        formData.append('file',event.target.files[0]);
        axios.post(
            "http://127.0.0.1:8000/"+"employee/savefile",
            formData)
            .then((response)=>{
                this.PhotoFileName=response.data;
            });
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
