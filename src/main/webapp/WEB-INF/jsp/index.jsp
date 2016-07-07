<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
 <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"> </link>
  <style type="text/css">
    .login-form {
      max-width: 300px;
      margin: 0 auto;
    }
    #inputUsername {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }
    #inputPassword {
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
  </style>
</head>
<body>
<h2>Hello World!</h2>

<script>
/*
         angular.module("sanapp", [])
         .controller("myCtrl", function($scope) {
         
         $scope.callJS=function(){
          $scope.myText="you clicked";
         }
                    });
  
  
  
  angular.module("sanapp", []).controller("myCtrl", function($scope, $http) {

$scope.callJS=function(){
 //$scope.myText="you clicked";
 //$scope.formData={};
 var param = JSON.stringify({username:this.username, password:this.password, phone:this.phone})
 $http.post("http://localhost:8080/AngularSpringMvcBasic/chkUser", param.
		 sucess(function(data){
			 alert("sucess")
		 });
	}
     
});

  
*/
</script>


<script>
angular.module('sanapp', [])
.controller('myCtrl', ['$scope', '$http', function($scope, $http) {
  this.callJS = function() {
    $http({
      method: 'POST',
      url: 'http://localhost:8080/AngularSpringMvcBasic/chkUser',
      data: JSON.stringify({username:this.username, password:this.password}),
    }).then(function successCallback(response) {
    	//this respnse will hold the json send from the controller
    	//here authType is send 
    	alert(" response " + response.data.authType);
      if(response.data.authType == "success") {
          $scope.errorMsg = "Registration Success";
      }
      else
        $scope.errorMsg = "Registration not Success";
    }, function errorCallback(response) {
      console.log(" error "+ angular.toJson(response));
    });
  }

}]);

</script>
<body ng-app="sanapp" ng-controller="myCtrl as getCtrl">
<div class="container">

  <form class="login-form" ng-submit="getCtrl.callJS()">
    <h2>Please sign in</h2>
    <label for="inputUsername" class="sr-only">Username</label>
    <input type="text" id="inputUsername" class="form-control" placeholder="Username"   ng-model="getCtrl.username" >
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password"  ng-model="getCtrl.password" >
    <label for="inputPhone" class="sr-only">Password</label>
    <div class="alert alert-danger" role="alert" ng-show="errorMsg">{{errorMsg}}</div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  </form>

</div>
</body>
</html>


