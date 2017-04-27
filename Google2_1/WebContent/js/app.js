var app = angular.module('myApp', []);
app.controller('personCtrl', function($scope, $http) {
	$scope.userList = [];
	$scope.authList = [];
	$scope.mappingList = [];
	$scope.userId = "";
	$scope.setData = function(){
		$http({
			method: 'POST',
			url: "http://192.168.0.66:8090/Google2/adminSelect.kkb"
		})
		.success(function(data) {
			$scope.userList = data.userList;
			$scope.authList = data.authList;
		})
		.error(function(data, status, headers, config) {
			console.log(data, status, headers, config);
		});
	};
	$scope.clickEvent = function(type, userId, authId){
		switch (type) {
		case "U":
			$scope.userId = userId;
			$("#userList a").removeClass("active");
			$("#authList a").removeClass("active");
			$("#" + userId).addClass("active");
			$http({
				method: 'POST',
				url: "http://192.168.0.66:8090/Google2/AdminAction!mapping.kkb",
				params: {"userId": userId}
			})
			.success(function(data) {
				$scope.mappingList = data.mappingList;
				$("#authList a").removeClass("active");
				for(var j = 0; j < $scope.authList.length; j++){
					for(var i = 0; i < $scope.mappingList.length; i++){
						if($scope.mappingList[i].AUTH_ID == $scope.authList[j].AUTH_ID){
							$("#"+$scope.mappingList[i].AUTH_ID).addClass("active");
							break;
						}
					}
				}
			})
			.error(function(data, status, headers, config) {
				console.log(data, status, headers, config);
			});
			break;
		case "A":
			if($scope.userId == ""){
				$("#authList a").removeClass("active");
				break;
			}else{
				var check = true;
				for(var i = 0; i < $scope.mappingList.length; i++){
					if($scope.mappingList[i].AUTH_ID == authId){
						check = false;
						break;
					}
				}
				if(check){
					$("#"+authId).addClass("active");
					$http({
						method: 'POST',
						url: "http://192.168.0.66:8090/Google2/AdminAction!insert.kkb",
						params: {"userId": $scope.userId,"authId":authId}
					})
					.success(function(data) {
						$scope.mappingList = [];
						$scope.mappingList = data.mappingList;
					})
					.error(function(data, status, headers, config) {
						console.log(data, status, headers, config);
					});
				}else{
					alert("선택 할 수 없습니다.");
				}
			}
			break;
		case "D":
			$http({
				method: 'POST',
				url: "http://192.168.0.66:8090/Google2/AdminAction!delete.kkb",
				params: {"userId": userId,"authId":authId}
			})
			.success(function(data) {
				$scope.mappingList = [];
				$scope.mappingList = data.mappingList;
			})
			.error(function(data, status, headers, config) {
				console.log(data, status, headers, config);
			});
			break;
		default:
			break;
		}
	}
	
	$scope.setData();
});