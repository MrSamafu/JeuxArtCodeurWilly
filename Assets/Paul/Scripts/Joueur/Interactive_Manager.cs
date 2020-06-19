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

    public GameObject InteractionCrosshair;

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
        RaycastHit hit; 
        Ray ray = Camera.ScreenPointToRay(Input.mousePosition); 

        //-------------INTERACTION RAMASSAGE D'OBJET-----------------
        if (Physics.Raycast (ray, out hit, 100.0f)) {
            if (hit.transform.tag == "Item" || hit.transform.tag == "Pistol") {

                InteractionCrosshair.SetActive(true);

            }else{
                InteractionCrosshair.SetActive(false);
            }
        }
        if (Input.GetButtonDown("Use")){ 
            if (Physics.Raycast (ray, out hit, 100.0f)) {
                if (hit.transform.tag == "Item" || hit.transform.tag == "Pistol") {

                    endGrabbedObject = false;
                    
                    GrabbedObj = hit.transform.gameObject;

                    Item item = GrabbedObj.GetComponent<Item>();
                    

                    GrabbedObj.GetComponent<BoxCollider>().enabled = false;
                    GrabbedObj.GetComponent<Rigidbody>().useGravity = false;
                    //GrabbedObj.transform.SetParent(grabPos.transform, false);
                    GrabbedObj.transform.parent = grabPos.transform;
                    GrabbedObj.transform.position = grabPos.transform.position;
                    GrabbedObj.transform.localPosition = Vector3.zero;
                    GrabbedObj.transform.localRotation = Quaternion.Euler(0,0,0);
                    GrabbedObj.transform.localScale = new Vector3 (1, 1, 1);
                    anim.SetBool("Taking an object ?", true);
                    StartCoroutine(WaitAnimGrabeObject());


                }
            }
        }
        if(endGrabbedObject == true){

            GrabbedObj = null;

        }

        if(GrabbedObj){

                GrabbedObj.transform.localPosition = Vector3.zero;
                GrabbedObj.transform.localRotation = Quaternion.Euler(0,0,0);
                GrabbedObj.transform.localScale = new Vector3 (1, 1, 1);

        
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


    }




    IEnumerator WaitAnimGrabeObject(){
        yield return new WaitForSeconds(2F);
        anim.SetBool("Taking an object ?", false);
        endGrabbedObject = true;
        Item item = GrabbedObj.GetComponent<Item>();
        this.GetComponent<Inventory>().AddItem(GrabbedObj, item.ID, item.type, item.description, item.icon);
    }





}
