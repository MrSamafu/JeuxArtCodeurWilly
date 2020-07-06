using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyInteract : MonoBehaviour
{
    public Behaviour[] Target;
    private int countTarget = 0;
    EnemyMove enemyMove;
    // Start is called before the first frame update
    void Start()
    {
        enemyMove = GetComponentInParent<EnemyMove>();
        for (int i = 0; i < Target.Length; i++)
        {
            Target[i].enabled = false;
            countTarget++;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            for (int i = 0; i < countTarget; i++)
            {
                Target[i].enabled = true;
            }
            if (!EnemyMove.detect)
            {
                enemyMove.attack();
                EnemyMove.detect = true;
            } 
                
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (!EnemyMove.detect)
        {
            if (other.gameObject.tag == "Player")
            {
                for(int i = 0; i < countTarget; i++)
                {
                    Target[i].enabled = false;
                }
            }
        }
        
    }
}
