using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

[System.Serializable]
public class IdleToCrouch : MonoBehaviour
{

    Animator animator;
    float InputX;
    float InputY;

    private float xPosCamera;
    private float zPosCamera;
    private bool crouching;
    public Cinemachine.CinemachineVirtualCamera HeadCamera;
    public GameObject MainCamera;
    public CapsuleCollider collisionPlayer;

    private float startedHeightCollPlayer;
    private Vector3 startedCenterCollPlayer;


    void Start()
    {
        crouching = false;
        animator = this.gameObject.GetComponentInChildren<Animator>();
        xPosCamera = MainCamera.transform.position.x;
        zPosCamera = MainCamera.transform.position.z;

        startedHeightCollPlayer = collisionPlayer.height;
        startedCenterCollPlayer = collisionPlayer.center;

    }

    // Update is called once per frame
    private void Update(){

        InputY = Input.GetAxis("Vertical");
        InputX = Input.GetAxis("Horizontal");

        if (Input.GetButtonDown("Crouch")){
            
            HeadCamera.m_Lens.NearClipPlane = 0.4F;
            
        }

        if (Input.GetButton("Crouch")){


            animator.SetBool("Crouch", true);

            collisionPlayer.height = 1.2F;
            collisionPlayer.center = new Vector3(startedCenterCollPlayer.x, 0.36F, startedCenterCollPlayer.z);

            xPosCamera = MainCamera.transform.position.x;
            zPosCamera = MainCamera.transform.position.z;
            MainCamera.transform.position = new Vector3(xPosCamera, 1F, zPosCamera);


        }
        if(Input.GetButtonUp("Crouch")){
            animator.SetBool("Crouch", false);
            xPosCamera = MainCamera.transform.position.x;
            zPosCamera = MainCamera.transform.position.z;

            StartCoroutine(WaitForNearClipPlane());

            MainCamera.transform.position = new Vector3(xPosCamera, 1.7F, zPosCamera);

        }


    }

    IEnumerator WaitForNearClipPlane(){
        HeadCamera.m_Lens.NearClipPlane = 0.6F;
        collisionPlayer.height = startedHeightCollPlayer;
        collisionPlayer.center = startedCenterCollPlayer;
        yield return new WaitForSeconds(0.3F);
        HeadCamera.m_Lens.NearClipPlane = 0.01F;
    }
}
