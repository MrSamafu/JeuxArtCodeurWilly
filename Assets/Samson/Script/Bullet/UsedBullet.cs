using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UsedBullet : MonoBehaviour
{
    private bool oneTime = false;
    public AudioClip fallBullet;

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.tag != "Pistol" && collision.gameObject.tag != "Player")
        {
            if(oneTime == false)
            {
                GetComponent<AudioSource>().PlayOneShot(fallBullet);
                oneTime = true;
            }
        }
    }
}
