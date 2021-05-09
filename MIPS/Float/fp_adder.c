/***
*
* Simplified positive floating point addition
*   - Software implementation of positive floating point addition regarding the
*   IEEE-754 single precision standard 
*
***/

#include <stdio.h>

int main() {
    
    /* Floating point numbers coded according to IEEE-754 single precision (32 bits) standard */
    /* signal(1) exponent(8) signigicand(23) */
    float a = 3.25;     /* IEEE-754 single precision coding: 0x40500000 */ 
    float b = 1.8125;   /* IEEE-754 single precision coding: 0x3FE80000 */
      
    /* a_int and b_int are used to perform logical operations over the floats a and b */
    /* Logical operations are not allowed over float type */
    int a_int = *(int *)&a;     /* int_a = float coding of a */
    int b_int = *(int *)&b;     /* int b = floar coding of b */
    
    int exp_a, exp_b;           /* a and b exponent field */
    int exp_diff;               /* Absolute difference between a and b exponents */
    int sum_exp;                 /* The greatest exponent between a and b */
    
    int a_mant, b_mant;         /* a and b mantissa field */
    int sum;
    float sum_float;
    
    /* Retrieves the exponent fields of a and b */
    exp_a = (a_int >> 23) & 0xFF;
    exp_b = (b_int >> 23) & 0xFF;; 
        
    /* Absolute difference between a and b exponents used to shift the lower number */
    exp_diff = exp_a - exp_b;
    
    if (exp_diff < 0)
        exp_diff = -exp_diff;     

    printf("exp_diff: %d\n",exp_diff);   
    
    /* Retrieves the mantissa field of a and b */ 
    a_mant = 0x007FFFFF & a_int;
    b_mant = 0x007FFFFF & b_int;
    
    /* Inserts the hidden 1 (bit 23) in the a and b mantissa before the shift */
    a_mant = (1<<23) | a_mant;
    b_mant = (1<<23) | b_mant;
        
    /* The two number must have the same exponent before the addition */
    /* Shifts the small number (smallest exponent) to adjust the exponent */
    /* Sets the greatest exponent, the result has the exponent of the greatest number */
    if (exp_a < exp_b) {
        a_mant = a_mant >> exp_diff;
        sum_exp = exp_b;
    }
    else {
        b_mant = b_mant >> exp_diff;
        sum_exp = exp_a;
    }
         
    /* Performs the addition */
    sum = a_mant + b_mant;

    /* Normalizes the result */
    /* If the result bit 24 is 1, it must be shifted left one bit and the result exponent is adjusted */
    if ( (sum & (1<<24) ) != 0 ) {
        sum = sum >> 1;
        sum_exp++;
    }
        
    
    /* Number reconstruction (IEEE-754) */
    sum = sum & ~(1<<23);       /* Removes the hidden 1 (bit 23) */
    sum_exp = sum_exp << 23;      /* Shifts the exponent to bits 30-23 */
    sum = sum_exp | sum;         /* Concatenates exponent and significand */
    
    
    sum_float = *(float *)&sum;     /* The integer variable sum is interpreted as a floating point number through the sum_float variable */
    printf("SW: %f + %f = %f\n",a,b,sum_float);  /* Integer sum */
    printf("HW: %f + %f = %f\n",a,b,a+b);        /* FPU sum */

         
    return 0;
}
