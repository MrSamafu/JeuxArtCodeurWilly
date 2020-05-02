using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundChecker : MonoBehaviour//détermine si le personne touche un sol ou non, cela permet de savoir si il peut ou non sauter
{
    private bool isGrounded = false;
    private PlayerController checker;

    private void Start()
    {
        checker = GetComponentInParent<PlayerController>();

    }

    public void OnTriggerStay(Collider other)
    {
        isGrounded = true;
        checker.ToucheFloor(isGrounded);
    }

    public void OnTriggerExit(Collider other)
    {
        
        isGrounded = false;
        checker.ToucheFloor(isGrounded);
    }
}
