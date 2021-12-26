<template>
  <div id="app">
    
    <form @submit.prevent="login">
      <div>
        <h1>Registiration Form</h1>
        <label for="username">username</label>
        <input name="username" v-model="username" placeholder="username">
      </div>
      <div>
        <label for="password">password</label>
        <input name="password" v-model="password" placeholder="password" type="password">
      </div>
      <input type="submit" value="register" @click="goToLogin()">
    </form>
    
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "App",
  data() {
    return {
      username: "",
      password: "",
      users:[]
    };
  },
  methods: {
    isDisabled: function(){
    	return !this.terms;
    },
    refreshData(variables){
        axios.get(variables.API_URL+"user")
        .then((response)=>{
            this.users=response.data;
        });

        
    },
    goToLogin(){
      this.$router.replace({ name: "login" });
    
      },
    async login() {
    const variables={
    API_URL:"http://127.0.0.1:8000/",
    PHOTO_URL:"http://127.0.0.1:8000/Photos/"
}

      const { username, password} = this;
      const res = await fetch(
        "https://SomberHandsomePhysics--five-nine.repl.co/register",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            username,
            password,
          })
        },
      );
      const data = await res.json();
      console.log(data);
      axios.post(variables.API_URL+"user",{
            UserName:this.username,
            Password:this.password,
            
        })
        .then((response)=>{
            this.refreshData(variables);
            this.$router.replace({ name: "login" });
        });
    }
  }
};
</script>


