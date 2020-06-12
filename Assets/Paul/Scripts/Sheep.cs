using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sheep : MonoBehaviour
{



    public bool EnColere = false;
    public bool Peur = false;
    public bool Pacifique = true;
    public int aFaim = 0;
    public int vie = 100;
    public int santé = 100;

    Animation anim;



    void Start()
    {
        anim = GetComponent<Animation> ();
    }




    void Update()
    {


        if(Peur){
            anim.Stop("Idle");
            anim.Play("Run");
        }
        if(EnColere){
            anim.Stop("Idle");
            anim.Play("Attack");
        }
        if(Pacifique){
            if(aFaim == 9){
                anim.Stop("Idle");
                anim.Play("GrazeA");
            }else if(aFaim == 10){
                anim.Stop("Idle");
                anim.Play("GrazeB");
            }else{
                anim.Play("Idle");
            }
        }
        



    }



}
