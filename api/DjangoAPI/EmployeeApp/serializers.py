from rest_framework import serializers
from EmployeeApp.models import Departments,Employees,Users


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departments
        fields = ('DepartmentId', 'DepartmentName')


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employees
        fields = ('EmployeeId', 'EmployeeName', 'Department', 'DateOfJoining', 'PhotoFileName')


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ('UserId', 'UserName', 'Password')