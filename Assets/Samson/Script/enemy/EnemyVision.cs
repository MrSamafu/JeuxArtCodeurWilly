using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyVision : MonoBehaviour
{
    private EnemyAction enemyAction;

    private void Start()
    {
        enemyAction = GetComponentInParent<EnemyAction>();
        
    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player")
        {
            StopCoroutine(PlayerAsLost());
            enemyAction.playerDetected = true;
        }
    }
    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            enemyAction.playerDetected = true;
            StopCoroutine(PlayerAsLost());
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if(other.gameObject.tag == "Player")
        {
            StartCoroutine(PlayerAsLost());
        }
    }

    IEnumerator PlayerAsLost()
    {
        yield return new WaitForSeconds(15f);
        enemyAction.playerDetected = false;
        enemyAction.playerLost = true;
    }
}
