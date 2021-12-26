import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'
import Main from './views/Main.vue'
import Register from './views/Register.vue'
import Employee from './views/Employee.vue'
import Department from './views/Department.vue'
import EmployeePop from './views/EmployeePop.vue'
import DepartmentPop from './views/DepartmentPop.vue'

Vue.use(Router)

const router =  new Router({
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/Main',
      name: 'main',
      component: Main
    },
    {
      path: '/department',
      name: 'department',
      component: Department,
      props: true
    },
    {
      path: '/departmentpop',
      name: 'departmentpop',
      component: DepartmentPop,
      props: true
    },
    {
      path:'/employee',
      name: 'employee',
      component: Employee,
      props: true
    },
    {
      path: '/employeepop',
      name: 'employeepop',
      component: EmployeePop,
      props: true
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
  ]
})

export default router
