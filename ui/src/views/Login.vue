<template>
    <div id="login">
        <h1>Login</h1>
        <input type="text" name="username" v-model="input.username" placeholder="Username" />
        <input type="password" name="password" v-model="input.password" placeholder="Password" />
        <button type="button" v-on:click="login_trigger()">Login</button>
        <button @click="goToRegister()">Register</button>

    </div>   
</template>

<script>
import axios from 'axios';
    export default {
        name: 'Login',
        data() {
            const variables={
            API_URL:"http://127.0.0.1:8000/",
            PHOTO_URL:"http://127.0.0.1:8000/Photos/"}
            const element = 0;
            
            this.refreshData(variables);
            return {
                input: {
                    username: "",
                    password: ""
                }
            }
        },
        methods: {
            refreshData(variables){
        axios.get(variables.API_URL+"user")
        .then((response)=>{
            this.users=response.data;
            
        });
        console.log (this.users)
        
        
    },
        goToRegister(){
        
        this.$router.replace({ name: "register" });
        },

    activate() {
    setTimeout(() => this.isHidden = false, 500);
    },
            login() 
            {

                
            var element = 0;
            
            
            
            this.activate();
            console.log (this.users)
            
        
                if(this.input.username != "" && this.input.password != "") {
                    for (let index = 0; index < this.users.length; index++) {
                        
                        if (this.users[index].UserName == this.input.username) {
                            if (this.users[index].Password == this.input.password) {
                                element = 1;
                            }
                            console.log ("password incorrect");
                        }
                        
                    }
                    if(element == 1) {
                        this.$emit("authenticated", true);
                        this.$router.replace({ name: "main" });
                    } else {
                        console.log("The username and / or password is incorrect");
                    }
                } else {
                    console.log("A username and password must be present");
                }
            },
            login_trigger(){
                this.login() 
                this.login()     


            },
            
        },
        
    }
</script>

<style scoped>
    #login {
        width: 500px;
        border: 1px solid #CCCCCC;
        background-color: #FFFFFF;
        margin: auto;
        margin-top: 200px;
        padding: 20px;
    }
</style>