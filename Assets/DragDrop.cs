using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class DragDrop : MonoBehaviour, IPointerDownHandler, IBeginDragHandler, IEndDragHandler, IDragHandler{
    
    [SerializeField] private Canvas canvas;

    private CanvasGroup canvasGroup;
    private RectTransform rectTransform;

    private void Awake(){
        rectTransform = GetComponent<RectTransform>();
        canvasGroup = GetComponent<CanvasGroup>();
    }


    public void OnBeginDrag(PointerEventData eventData){
        Debug.Log("begindrag");
        canvasGroup.alpha = .9f;
        canvasGroup.blocksRaycasts = false;

    }



    public void OnDrag(PointerEventData eventData){
        transform.position = Input.mousePosition;
    }



    public void OnEndDrag(PointerEventData eventData){

        if(eventData.pointerCurrentRaycast.gameObject.tag == "EmptyUIInventory"){
            transform.localPosition = Vector3.zero;
        }
        canvasGroup.alpha = 1f;
        canvasGroup.blocksRaycasts = true;
    }




    public void OnPointerDown(PointerEventData eventData){

        Debug.Log("OnPointerDown");
    }



}
