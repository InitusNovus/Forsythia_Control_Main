#include "TorqueVectoring.h"

float torqueVectoringFunction(float Accel_p,float FL_SteeringAngle,float FR_SteeringAngle,float v_angle){
    //fixme : real torque vectoring
    
    int value = 2.37*Accel_p-11.8;
    return value;

}