<template>
<div>

<button type="button"
class="btn btn-primary m-2 fload-end"

@click="goToEmployeePop()">
 Add Employee
</button>
<button type="button" @click="goback()" >⏎</button>
<table class="table table-striped">
<thead>
    <tr>
        <th>
            Employee Id
        </th>
        <th>
            Employee Name
        </th>
        <th>
            Department
        </th>
        <th>
            DOJ
        </th>
        <th>
            Options
        </th>
    </tr>
</thead>
<tbody>
    <tr v-for="emp in employees" >
        <td>{{emp.EmployeeId}}</td>
        <td>{{emp.EmployeeName}}</td>
        <td>{{emp.Department}}</td>
        <td>{{emp.DateOfJoining}}</td>
        <td>
            <button type="button"
            class="btn btn-light mr-1"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal"
            @click="editClick(emp)">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                </svg>
            </button>
            <button type="button" @click="deleteClick(emp.EmployeeId)"
            class="btn btn-light mr-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                </svg>
            </button>

        </td>
    </tr>
</tbody>
</table>


</div>
</template>

<script>
    import axios from 'axios';
    export default {
        name: 'Employee',
        
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
    editClick(){
        this.$router.replace({ name: "employeepop" });

    },
    goback(){

        this.$router.replace({ name: "main" });
    },  
    goToEmployeePop(){
        
        this.$router.replace({ name: "employeepop" });
        },
    createClick(){
        this.$router.replace({ name: "view/employee" });

    },    
    addClick(){
        console.log (this.employees);
        console.log (this.departments);
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
        axios.post(variables.API_URL+"employee",{
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
            this.refreshData();
            alert(response.data);
        });

    },
    imageUpload(event){
        let formData=new FormData();
        formData.append('file',event.target.files[0]);
        axios.post(
            variables.API_URL+"employee/savefile",
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
