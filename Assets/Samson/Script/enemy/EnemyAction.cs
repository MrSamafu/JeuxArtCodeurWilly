using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAction : MonoBehaviour
{
    NavMeshAgent agent;
    GameObject target;
    Animator anim;
    GameObject player;
    private float randomDistance;
    public bool playerDetected;
    public bool playerLost;
    private bool dead;
    
    public int randomMin;
    public int randomMax;
    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        target = GameObject.Find("EnemyLoop (" + Random.Range(randomMin, randomMax) + ")");
        anim = GetComponent<Animator>();
        player = GameObject.Find("Dr Paul");
        randomDistance = Random.Range(5, 8);
        StartCoroutine(RandomChange());
        StartCoroutine(ReachPoint());
        dead = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (!dead)
        {
                //Patrouille
            if (Vector3.Distance(transform.position, target.transform.position) <= 1f && !playerDetected)
            {
                StartCoroutine(ReachPoint());
            }
            else if (playerDetected)
            {
                //Cours vers le joueur
                FindPlayer();
            }
            else if (playerLost)
            {
                PlayerLost();
            }
            anim.SetBool("Detect", playerDetected);
            Debug.DrawRay(transform.position + new Vector3(0, 1.3f, 0), (transform.position - player.transform.position).normalized, Color.blue);
        }
    }
    public void FindPlayer()
    {
        anim.SetBool("Walk", false);//si le joueur est vu on arrete l'animation de marche

        if (Vector3.Distance(transform.position, player.transform.position) <= 2f)
        {
            anim.SetBool("Run", false);
            agent.isStopped = true;
            agent.speed = 1.7f;
        }
        else
        {
            agent.isStopped = false;
            anim.SetBool("Run", true);
            agent.speed = 4;
            agent.SetDestination(player.transform.position);
        }
        
    }
    public void PlayerLost()
    {
        playerLost = false;
        anim.SetBool("Run", false);
        agent.speed = 1.7f;
        StartCoroutine(ReachPoint());
    }
    public void IsDead()
    {
        dead = true;
        GetComponent<EnemyVariable>().enabled = false;
        StopAllCoroutines();
        anim.SetTrigger("Dead");
        anim.SetBool("Run", false);
        anim.SetBool("Walk", false);
        anim.SetBool("Detect", false);
        agent.isStopped = true;
    }
    IEnumerator ReachPoint()
    {
        agent.isStopped = true;
        anim.SetBool("Walk", false);
        target = GameObject.Find("EnemyLoop (" + Random.Range(randomMin, randomMax) + ")");
        yield return new WaitForSeconds(4f);
        anim.SetBool("Walk", true);
        agent.isStopped = false;
        agent.SetDestination(target.transform.position);
        
    }
    IEnumerator RandomChange()
    {
        yield return new WaitForSeconds(40f);
        randomDistance = Random.Range(5, 15);
        StartCoroutine(RandomChange());
    }
}
