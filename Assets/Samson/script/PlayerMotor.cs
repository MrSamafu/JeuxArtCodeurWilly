using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class PlayerMotor : MonoBehaviour
{
    private Vector3 velocity;
    private Vector3 rotation;
    private float cameraRotationX = 0f;
    private float jumpForce;
    private bool isJumping = false;
    private float currentCameraRotationX = 0f;
    public float cameraRotationLimit = 85f;
    public bool climb = false;
    public float speedClimb = 2f;
    public float direction;


    public Cinemachine.CinemachineVirtualCamera cam;

    private Rigidbody rb;

    public bool isWalking;

    private void Start()
    {
        rb = GetComponent<Rigidbody>();
    }


    public void Move(Vector3 _velocity)
    {
        velocity = _velocity;

    }


    private void FixedUpdate()
    {
        PerformMovement();
        PerformRotation();
       
    }


    private void PerformMovement(){
        if(velocity != Vector3.zero)
        {
            isWalking = true;
            rb.MovePosition(rb.position + velocity * Time.fixedDeltaTime);
        }else{
            isWalking = false;
        }
        if(isJumping != false)
        {
            rb.AddForce(new Vector3(0f,jumpForce,0f));
            isJumping = false;
        }
        if (climb)
        {
            Climbing(speedClimb);
        }
    }


    public void Rotate(Vector3 _rotation){
        rotation = _rotation;
    }


    public void RotateCamera(float _cameraRotationX){
        cameraRotationX = _cameraRotationX;
    }


    public void jump(float _jumpForce){
        jumpForce = _jumpForce;
        isJumping = true;
    }


    private void PerformRotation(){

        //récupération de la rotation + clamp la rotation
        rb.MoveRotation(rb.rotation * Quaternion.Euler(rotation));
        currentCameraRotationX -= cameraRotationX;
        currentCameraRotationX = Mathf.Clamp(currentCameraRotationX, -cameraRotationLimit, cameraRotationLimit);
        //applique les changement à la camera après le clamp
        cam.transform.localEulerAngles = new Vector3(currentCameraRotationX, 0f, 0f);

        
    }
    public void Climbing(float climbSpeed)
    {
        
        rb.transform.Translate(Vector3.up * climbSpeed * direction * Time.fixedDeltaTime);
    }
    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Ladder")
        {
            rb.useGravity = false;
            climb = true;
            
        }
    }
    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Ladder")
        {
            rb.transform.Translate(transform.TransformDirection(Vector3.forward * direction / 2));
            rb.useGravity = true;
            climb = false;
            
        }
    }
    public void directionClimb(float _direction)
    {
        direction = _direction;
    }


}
