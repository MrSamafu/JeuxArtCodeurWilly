using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Slot : MonoBehaviour, IPointerClickHandler
{

    public GameObject item;

    public bool empty;
    public int ID;
    public string type;
    public string description;
    public Sprite icon;

    public Transform slotIconGO;

    public void OnPointerClick(PointerEventData pointerEventData){
        


    }

    private void Start(){
        
        slotIconGO = transform.GetChild(0);
        slotIconGO.GetComponent<Image>().enabled = false;

    }

    public void UpdateSlot(){
        slotIconGO.GetComponent<Image>().enabled = true;
        slotIconGO.GetComponent<Image>().sprite = icon;

    }



}
