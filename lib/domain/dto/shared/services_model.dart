class ServicesModel{
  String? headerTitle;
  List<ServiceDetails>? details;
  ServicesModel({this.details,this.headerTitle,});
}
class ServiceDetails{
  String? title;
  String? imageUrl;
  String? servicesDetailsCallBack;
  ServiceDetails({this.title,this.imageUrl,this.servicesDetailsCallBack});
}