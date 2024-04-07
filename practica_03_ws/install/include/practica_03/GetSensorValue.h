// Generated by gencpp from file practica_03/GetSensorValue.msg
// DO NOT EDIT!


#ifndef PRACTICA_03_MESSAGE_GETSENSORVALUE_H
#define PRACTICA_03_MESSAGE_GETSENSORVALUE_H

#include <ros/service_traits.h>


#include <practica_03/GetSensorValueRequest.h>
#include <practica_03/GetSensorValueResponse.h>


namespace practica_03
{

struct GetSensorValue
{

typedef GetSensorValueRequest Request;
typedef GetSensorValueResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetSensorValue
} // namespace practica_03


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::practica_03::GetSensorValue > {
  static const char* value()
  {
    return "bcd568b22b6f12ae3224ce5f80ba4ae1";
  }

  static const char* value(const ::practica_03::GetSensorValue&) { return value(); }
};

template<>
struct DataType< ::practica_03::GetSensorValue > {
  static const char* value()
  {
    return "practica_03/GetSensorValue";
  }

  static const char* value(const ::practica_03::GetSensorValue&) { return value(); }
};


// service_traits::MD5Sum< ::practica_03::GetSensorValueRequest> should match
// service_traits::MD5Sum< ::practica_03::GetSensorValue >
template<>
struct MD5Sum< ::practica_03::GetSensorValueRequest>
{
  static const char* value()
  {
    return MD5Sum< ::practica_03::GetSensorValue >::value();
  }
  static const char* value(const ::practica_03::GetSensorValueRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::practica_03::GetSensorValueRequest> should match
// service_traits::DataType< ::practica_03::GetSensorValue >
template<>
struct DataType< ::practica_03::GetSensorValueRequest>
{
  static const char* value()
  {
    return DataType< ::practica_03::GetSensorValue >::value();
  }
  static const char* value(const ::practica_03::GetSensorValueRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::practica_03::GetSensorValueResponse> should match
// service_traits::MD5Sum< ::practica_03::GetSensorValue >
template<>
struct MD5Sum< ::practica_03::GetSensorValueResponse>
{
  static const char* value()
  {
    return MD5Sum< ::practica_03::GetSensorValue >::value();
  }
  static const char* value(const ::practica_03::GetSensorValueResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::practica_03::GetSensorValueResponse> should match
// service_traits::DataType< ::practica_03::GetSensorValue >
template<>
struct DataType< ::practica_03::GetSensorValueResponse>
{
  static const char* value()
  {
    return DataType< ::practica_03::GetSensorValue >::value();
  }
  static const char* value(const ::practica_03::GetSensorValueResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PRACTICA_03_MESSAGE_GETSENSORVALUE_H