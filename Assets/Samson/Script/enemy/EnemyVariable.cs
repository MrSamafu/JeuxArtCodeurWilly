using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyVariable : MonoBehaviour
{
    public float life = 100f;
    public float armor = 100f;
    Animator anim;
    Component IK;

    private void Start()
    {
        anim = GetComponent<Animator>();
        IK = GetComponent<IKControl>();
    }
    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.tag == "Bullet")
        {
            life -= 25f;
            Debug.Log("enemy life = " + life);
        }
    }
    private void FixedUpdate()
    {
        if (life <= 0)
        {
            anim.SetBool("Dead", true);
            IK.gameObject.SetActive(false);
            
        }
    }
}
