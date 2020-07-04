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
    
    private void Update()
    {
        if (life <= 0)
        {
            anim.SetBool("Dead", true);
            IK.gameObject.SetActive(false);
            
        }
    }
    public void Touch(float damage)
    {
        life = life - damage;
        Debug.Log("enemy life : " + life);
    }
}
