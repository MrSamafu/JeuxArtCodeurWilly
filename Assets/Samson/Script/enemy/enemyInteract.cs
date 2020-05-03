using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyInteract : MonoBehaviour
{
    public Behaviour[] Target;
    private int countTarget = 0;
    // Start is called before the first frame update
    void Start()
    {
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
        }
    }
    private void OnTriggerExit(Collider other)
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
