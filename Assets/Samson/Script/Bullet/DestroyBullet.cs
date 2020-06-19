using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyBullet : MonoBehaviour
{
    // Start is called before the first frame update
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag != "Pistol" && collision.gameObject.tag != "Player")
        {

            Destroy(gameObject);
        }
        
    }
   
}
