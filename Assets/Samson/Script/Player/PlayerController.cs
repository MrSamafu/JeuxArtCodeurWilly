using UnityEngine;

[RequireComponent(typeof(PlayerMotor))]
public class PlayerController : MonoBehaviour
{

    public float speed = 10f;
    public float lookSensitivity = 3f;
    private PlayerMotor motor;
    private bool isJumping = false;
    public float jumpForce = 300f;
    public bool isGrounded;
    public GameObject groundChecker;

    Animator anim;

    private void Start()
    {
        motor = GetComponent<PlayerMotor>(); 
        anim = GetComponentInChildren<Animator> ();
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

        float _cameraRotationX = _xRot * lookSensitivity;

        motor.RotateCamera(_cameraRotationX);
        motor.directionClimb(_zMov);






        if (Input.GetButtonDown("Jump") && isJumping == false && isGrounded == true)//fonction saut / uniquement si le personnage touche un sol
        {
            anim.SetBool("Jump", true);
            isJumping = true;
            motor.jump(jumpForce);//envoie la valeur au PlayerMotor pour etre éxecuter
            isJumping = false;
        }

        

        
    }
     public void ToucheFloor(bool _isGrounded)
    {
        anim.SetBool("Jump", false);
        isGrounded = _isGrounded;

    }
    

}
