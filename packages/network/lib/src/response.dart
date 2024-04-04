/// 业务接口返回数据的形态
class Response{
  late dynamic data;
  late int errorCode;
  late String errorMsg;

  Response({required this.errorCode, required this.errorMsg, this.data});
}