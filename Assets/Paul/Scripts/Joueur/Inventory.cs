using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Inventory : MonoBehaviour
{

    private bool inventoryEnabled;
    Animator anim;
    public GameObject inventory;
    private int allSlotsInventory;
    private int allSlotsBar;
    private int enabledSlots;
    private GameObject[] slot;
    private GameObject[] slotBar;
    public GameObject slotHolder;
    public GameObject slotHolderBar;

    public GameObject slotsBar;
    public GameObject slotsUI;

    public int activatedSlot = 0;
    public GameObject activeSlotCanvas;
    public GameObject itemTaked;
    public Transform rightHand;
    private bool TakingObject;

    void Start(){
        itemTaked = null;

        allSlotsInventory = 16;
        allSlotsBar = 5;
        slot = new GameObject[allSlotsInventory];
        slotBar = new GameObject[allSlotsBar];

        //COMPONENTS
        anim = GetComponentInChildren<Animator>();
        

        // INVENTORY BOUCLE
        for(int i = 0; i < allSlotsInventory; i++){
            slot[i] = slotHolder.transform.GetChild(i).gameObject;
            if(slot[i].GetComponent<Slot>().item == null){
                slot[i].GetComponent<Slot>().empty = true;
            }
        }

        // BAR BOUCLE
        for(int i = 0; i < allSlotsBar; i++){
            slotBar[i] = slotHolderBar.transform.GetChild(i).gameObject;
            if(slotBar[i].GetComponent<Slot>().item == null){
                slotBar[i].GetComponent<Slot>().empty = true;
            }
        }

    }


    public void Update(){
        
        if(Input.GetButtonDown("Inventory"))
            inventoryEnabled = !inventoryEnabled;

        if(inventoryEnabled == true){
            slotsUI.GetComponent<Canvas>().enabled = true;
        } else {
            slotsUI.GetComponent<Canvas>().enabled = false;
            slotsBar.SetActive(true);
        }



        // VISER AVEC UN PISTOL
        if(itemTaked != null){
            
            gameObject.GetComponentInChildren<DitzelGames.FastIK.FastIKFabric>().enabled = true;


            if(itemTaked.tag == "Pistol"){
                anim.SetBool("Have a pistol ?", true);
                if (Input.GetMouseButtonDown(1))
                    anim.SetBool("Aim with pistol ?", true);

                else if (Input.GetMouseButtonUp(1))
                    anim.SetBool("Aim with pistol ?", false);

            }else{
                    anim.SetBool("Have a pistol ?", false);
            }
        }else{

            gameObject.GetComponentInChildren<DitzelGames.FastIK.FastIKFabric>().enabled = false;

        }

        //-----------GESTION DE LA BAR--------------
        if (Input.GetKeyDown (KeyCode.Alpha1)){
            if(itemTaked != null){
                itemTaked.SetActive(false);
                itemTaked.transform.SetParent(slotBar[activatedSlot].transform, false);
                itemTaked.GetComponent<Item>().equipped = false;
            }
            activatedSlot = 0;
            itemTaked = null;
            itemTaked = slotBar[0].GetComponent<Slot>().item.gameObject;
        }

        if (Input.GetKeyDown (KeyCode.Alpha2)){
            if(itemTaked != null){
                itemTaked.SetActive(false);
                itemTaked.transform.SetParent(slotBar[activatedSlot].transform, false);
                itemTaked.GetComponent<Item>().equipped = false;
            }
            activatedSlot = 1;
            itemTaked = null;
            itemTaked = slotBar[1].GetComponent<Slot>().item.gameObject;
        }

        if (Input.GetKeyDown (KeyCode.Alpha3)){
            if(itemTaked != null){
                itemTaked.SetActive(false);
                itemTaked.transform.SetParent(slotBar[activatedSlot].transform, false);
                itemTaked.GetComponent<Item>().equipped = false;
            }
            activatedSlot = 2;
            itemTaked = null;
            itemTaked = slotBar[2].GetComponent<Slot>().item.gameObject;
        }

        if (Input.GetKeyDown (KeyCode.Alpha4)){
            if(itemTaked != null){
                itemTaked.SetActive(false);
                itemTaked.transform.SetParent(slotBar[activatedSlot].transform, false);
                itemTaked.GetComponent<Item>().equipped = false;
            }
            activatedSlot = 3;
            itemTaked = null;
            itemTaked = slotBar[3].GetComponent<Slot>().item.gameObject;
        }

        if (Input.GetKeyDown (KeyCode.Alpha5)){
            if(itemTaked != null){
                itemTaked.SetActive(false);
                itemTaked.transform.SetParent(slotBar[activatedSlot].transform, false);
                itemTaked.GetComponent<Item>().equipped = false;
            }
            activatedSlot = 4;
            itemTaked = null;
            itemTaked = slotBar[4].GetComponent<Slot>().item.gameObject;
        }



        //GESTION TAKE DE L'ITEM DANS LA BAR
        //1
        if(itemTaked != null){

            //1
            if (activatedSlot == 0){
                slotBar[0].GetComponent<Image>().color = new Color32(0,106,171,100);
                TakingObject = true;

                if(TakingObject){
                    itemTaked.transform.SetParent(rightHand.transform, false);
                    itemTaked.SetActive(true);

                    itemTaked.transform.localPosition = new Vector3(0, 0, 0);
                    itemTaked.transform.localRotation = Quaternion.Euler(0,0,0);
                    itemTaked.GetComponent<Item>().equipped = true;
                    TakingObject = false;
                }
            }else{
                slotBar[0].GetComponent<Image>().color = new Color32(255,255,255,100);
                
            }//-----------------



            //2
            if (activatedSlot == 1){
                slotBar[1].GetComponent<Image>().color = new Color32(0,106,171,100);
                TakingObject = true;

                if(TakingObject){
                    itemTaked.transform.SetParent(rightHand.transform, false);
                    itemTaked.SetActive(true);

                    itemTaked.transform.localPosition = new Vector3(0, 0, 0);
                    itemTaked.transform.localRotation = Quaternion.Euler(0,0,0);
                    itemTaked.GetComponent<Item>().equipped = true;
                    TakingObject = false;
                }

            }else{
                slotBar[1].GetComponent<Image>().color = new Color32(255,255,255,100);
  
            }//------------------

            //3
            if (activatedSlot == 2){
                slotBar[2].GetComponent<Image>().color = new Color32(0,106,171,100);
                TakingObject = true;

                if(TakingObject){
                    itemTaked.transform.SetParent(rightHand.transform, false);
                    itemTaked.SetActive(true);

                    itemTaked.transform.localPosition = new Vector3(0, 0, 0);
                    itemTaked.transform.localRotation = Quaternion.Euler(0,0,0);
                    itemTaked.GetComponent<Item>().equipped = true;
                    TakingObject = false;
                }
            }else{
                slotBar[2].GetComponent<Image>().color = new Color32(255,255,255,100);
      
            }//---------------

            //4
            if (activatedSlot == 3){
                slotBar[3].GetComponent<Image>().color = new Color32(0,106,171,100);
                TakingObject = true;

                if(TakingObject){
                    itemTaked.transform.SetParent(rightHand.transform, false);
                    itemTaked.SetActive(true);

                    itemTaked.transform.localPosition = new Vector3(0, 0, 0);
                    itemTaked.transform.localRotation = Quaternion.Euler(0,0,0);
                    itemTaked.GetComponent<Item>().equipped = true;
                    TakingObject = false;
                }
            }else{
                slotBar[3].GetComponent<Image>().color = new Color32(255,255,255,100);
         
            }//---------------------

            //5
            if (activatedSlot == 4){
                slotBar[4].GetComponent<Image>().color = new Color32(0,106,171,100);
                TakingObject = true;

                if(TakingObject){
                    itemTaked.transform.SetParent(rightHand.transform, false);
                    itemTaked.SetActive(true);

                    itemTaked.transform.localPosition = new Vector3(0, 0, 0);
                    itemTaked.transform.localRotation = Quaternion.Euler(0,0,0);
                    itemTaked.GetComponent<Item>().equipped = true;
                    TakingObject = false;
                }
            }else{
                slotBar[4].GetComponent<Image>().color = new Color32(255,255,255,100);

            }//----------------------
        


        }



    }



    public void AddItem(GameObject itemObject, int itemID, string itemType, string itemDescription, Sprite itemIcon){
        
        for(int y = 0; y < allSlotsBar; y++){

            if(slotBar[y].GetComponent<Slot>().empty){

                //add item to slot BAR
                itemObject.GetComponent<Item>().pickedUp = true;


                slotBar[y].GetComponent<Slot>().item = itemObject;
                slotBar[y].GetComponent<Slot>().icon = itemIcon;
                slotBar[y].GetComponent<Slot>().type = itemType;
                slotBar[y].GetComponent<Slot>().ID = itemID;
                slotBar[y].GetComponent<Slot>().description = itemDescription;

                itemObject.transform.parent = slotBar[y].transform;
                itemObject.SetActive(false);

                slotBar[y].GetComponent<Slot>().UpdateSlot();

                slotBar[y].GetComponent<Slot>().empty = false;
                return;
            }

        }

        for(int y = 0; y < allSlotsInventory; y++){

            if(slot[y].GetComponent<Slot>().empty){

                //add item to slot
                itemObject.GetComponent<Item>().pickedUp = true;


                slot[y].GetComponent<Slot>().item = itemObject;
                slot[y].GetComponent<Slot>().icon = itemIcon;
                slot[y].GetComponent<Slot>().type = itemType;
                slot[y].GetComponent<Slot>().ID = itemID;
                slot[y].GetComponent<Slot>().description = itemDescription;


                itemObject.transform.parent = slot[y].transform;
                itemObject.SetActive(false);


                slot[y].GetComponent<Slot>().UpdateSlot();

                slot[y].GetComponent<Slot>().empty = false;
                return;
            }

        }

    }








}
