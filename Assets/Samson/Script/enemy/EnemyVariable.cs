using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyVariable : MonoBehaviour
{
    public float life = 100f;
    public float armor = 100f;
    Animator anim;
    EnemyAction enemyAction;

    private void Start()
    {
        anim = GetComponent<Animator>();
        enemyAction = GetComponent<EnemyAction>();
        
    }
    
    private void Update()
    {
        if (life <= 0)
        {
            enemyAction.IsDead();
        }
    }
    public void Touch(float damage)
    {
        life = life - damage;
        Debug.Log("enemy life : " + life);
    }
}
