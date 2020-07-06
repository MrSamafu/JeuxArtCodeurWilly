using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyMove : MonoBehaviour
{
    NavMeshAgent agent;
    GameObject target;
    Animator anim;
    GameObject player;
    public static bool detect;

    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        target = GameObject.Find("EnemyLoop (" + Random.Range(1, 12) + ")");
        anim = GetComponent<Animator>();
        StartCoroutine(ReachPoint());
        player = GameObject.Find("enemyShootTarget");
        detect = false;

    }

    // Update is called once per frame
    void Update()
    {
        if (!detect)
        {
            if (Vector3.Distance(transform.position, target.transform.position) <= 1f)
            {
                StartCoroutine(ReachPoint());
            }

        } 
        else if (detect)
        {
            if(Vector3.Distance(transform.position, player.transform.position) <= 5f)
            {
                agent.isStopped = true;
            }
            else
            {
                agent.SetDestination(player.transform.position);
            }
        }
        
    }
    public void attack()
    {
        agent.SetDestination(player.transform.position);
    }
    IEnumerator ReachPoint()
    {
        agent.isStopped = true;
        anim.SetBool("Walk", false);
        yield return new WaitForSeconds(2f);
        target = GameObject.Find("EnemyLoop (" + Random.Range(1, 12) + ")");
        anim.SetBool("Walk", true);
        agent.isStopped = false;
        agent.SetDestination(target.transform.position);
    }
}
