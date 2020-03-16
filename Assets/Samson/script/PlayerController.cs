﻿using UnityEngine;

[RequireComponent(typeof(PlayerMotor))]
public class PlayerController : MonoBehaviour
{

    public float speed = 10f;
    public float lookSensitivity = 3f;
    private PlayerMotor motor;
    private bool isJumping = false;
    public float jumpForce = 300f;
    private bool isGrounded;

    public GameObject groundChecker;

    

    private void Start()
    {
        motor = GetComponent<PlayerMotor>();
        
        
    }

    private void Update()
    {
        float _xMov = Input.GetAxisRaw("Horizontal");
        float _zMov = Input.GetAxisRaw("Vertical");

        Vector3 _moveHorizontal = transform.right * _xMov;
        Vector3 _moveVertical = transform.forward * _zMov;

        Vector3 _velocity = (_moveHorizontal + _moveVertical).normalized * speed; //regarder doc "normalized"

        motor.Move(_velocity);

        float _yRot = Input.GetAxisRaw("Mouse X");

        Vector3  _rotation= new Vector3(0, _yRot, 0) * lookSensitivity;

        motor.Rotate(_rotation);

        float _xRot = Input.GetAxisRaw("Mouse Y");

        Vector3 _cameraRotation = new Vector3(_xRot, 0, 0) * lookSensitivity;

        motor.RotateCamera(_cameraRotation);

        if (groundChecker.GetComponent<BoxCollider>().isTrigger)
        {
            isGrounded = true;
            Debug.Log(isGrounded);
        }
        else if (!groundChecker.GetComponent<BoxCollider>().isTrigger)
        {
            isGrounded = false;
            Debug.Log(isGrounded);
        }

        if (Input.GetButtonDown("Jump")&& isJumping == false){

            isJumping = true;
            motor.jump(jumpForce);
            isJumping = false;
        }

        

        
    }

}
