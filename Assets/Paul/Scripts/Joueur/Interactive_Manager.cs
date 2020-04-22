using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactive_Manager : MonoBehaviour
{

    Animator anim;
    public Camera Camera;

    public Cinemachine.CinemachineVirtualCamera MainFPSCamera;
    public Cinemachine.CinemachineVirtualCamera CameraInventory;
    public bool isInInventory = false;

    public GameObject GrabbedObj;
    public Transform grabPos;
    public bool endGrabbedObject;
    public GameObject HandLeft;

    void Start(){
        
        //COMPONENTS
        anim = GetComponentInChildren<Animator>();

        //CURSOR
        Cursor.visible = true;
        Screen.lockCursor = true;

        //INIT PARAMETERS
        anim.SetBool("Have a pistol ?", false);
        anim.SetBool("Aim with pistol ?", false);
        anim.SetBool("Taking an object ?", false);

    }



    void Update(){
        

        anim.SetFloat("horizontal", Input.GetAxisRaw("Horizontal"));



        //-------------INTERACTION RAMASSAGE D'OBJET-----------------
        if (Input.GetButtonDown("Use")){ 
            RaycastHit hit; 
            Ray ray = Camera.ScreenPointToRay(Input.mousePosition); 
            if (Physics.Raycast (ray, out hit, 100.0f)) {
                if (hit.transform.tag == "Pistol") {
                    endGrabbedObject = false;
                    
                    GrabbedObj = hit.transform.gameObject;
                    GrabbedObj.GetComponent<BoxCollider>().enabled = false;
                    GrabbedObj.GetComponent<Rigidbody>().useGravity = false;
                    GrabbedObj.transform.position = new Vector3(0, 0, 0);
                    GrabbedObj.transform.rotation = Quaternion.Euler(0,0,0);
                    GrabbedObj.transform.localScale = new Vector3(1, 1, 1);
                    GrabbedObj.transform.SetParent(grabPos.transform, false);
                    anim.SetBool("Taking an object ?", true);
                    StartCoroutine(WaitAnimGrabeObject());
                }
            }
        }
        if(endGrabbedObject == true){

            GrabbedObj = null;

        }


        if(GrabbedObj){

        //        GrabbedObj.transform.rotation = Quaternion.RotateTowards(GrabbedObj.transform.rotation, grabPos.rotation, 2.5F * Time.deltaTime);
        
        }



        //----------------INVENTAIRE--------------------------
        if (Input.GetButtonDown("Inventory")){
            if(isInInventory == false){ 
                CameraInventory.Priority = 1001;
                Cursor.visible = true;
                Screen.lockCursor = false;
                isInInventory = true;
                anim.SetBool("Is In Inventory ?", true);
            }else if(isInInventory == true){ 
                isInInventory = false;
                anim.SetBool("Is In Inventory ?", false);
                CameraInventory.Priority = 1;
                Cursor.visible = false;
                Screen.lockCursor = true;
            }
        }

        if (Input.GetButtonDown("Cancel")){ 
            if(isInInventory == true){ 
                isInInventory = false;
                anim.SetBool("Is In Inventory ?", false);
                CameraInventory.Priority = 1;
                Cursor.visible = false;
                Screen.lockCursor = true;
            }
        }
        //-----------FIN INVENTAIRE--------------------------





        // VISER AVEC UN PISTOL
        if (Input.GetMouseButtonDown(1))
        anim.SetBool("Aim with pistol ?", true);

        else if (Input.GetMouseButtonUp(1))
        anim.SetBool("Aim with pistol ?", false);









    }


    IEnumerator WaitAnimGrabeObject(){

        yield return new WaitForSeconds(3.5F);
        anim.SetBool("Taking an object ?", false);
        endGrabbedObject = true;
        Destroy(GrabbedObj);
    }





}
