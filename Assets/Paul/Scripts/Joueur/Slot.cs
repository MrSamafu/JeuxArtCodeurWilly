using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Slot : MonoBehaviour, IDropHandler
{

    public GameObject item;

    public bool empty;
    public int ID;
    public string type;
    public string description;
    public Sprite icon;
    public Transform slotIconGO;

    public void OnDrop(PointerEventData eventData){

        if(eventData.pointerDrag != null){
            Slot oldItem = eventData.pointerDrag.GetComponentInParent<Slot>();

            //eventData.pointerDrag.GetComponent<RectTransform>().anchoredPosition = GetComponent<RectTransform>().anchoredPosition;
            ID = oldItem.ID;
            type = oldItem.type;
            description = oldItem.description;
            icon = oldItem.icon;
            item = oldItem.item;
            empty = false;


            oldItem.empty = true;
            oldItem.item = null;
            oldItem.ID = 0;
            oldItem.type = null;
            oldItem.description = null;
            oldItem.icon = null;
            oldItem.slotIconGO.GetComponent<Image>().enabled = false;

            UpdateSlot();
        }

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
