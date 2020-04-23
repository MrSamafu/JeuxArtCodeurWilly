using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Inventory : MonoBehaviour
{

    private bool inventoryEnabled;

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

    void Start(){
        allSlotsInventory = 16;
        allSlotsBar = 5;
        slot = new GameObject[allSlotsInventory];
        slotBar = new GameObject[allSlotsBar];

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


    void Update(){
        
        if(Input.GetButtonDown("Inventory"))
            inventoryEnabled = !inventoryEnabled;

        if(inventoryEnabled == true){
            slotsUI.GetComponent<Canvas>().enabled = true;
        } else {
            slotsUI.GetComponent<Canvas>().enabled = false;
            slotsBar.SetActive(true);
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
