﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Item : MonoBehaviour
{

    public int ID;
    public string type;
    public string description;
    public Sprite icon;

    public bool pickedUp;
    public bool equipped;

    void Update(){
        
        if(equipped){
        
            //Equiper le joueur (a voir plus tard)

        }

    }


    public void ItemUsage(){
        
        if(type == "Arme"){
        
            equipped = true;

        }

    }





}
