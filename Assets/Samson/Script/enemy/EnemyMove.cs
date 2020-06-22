﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyMove : MonoBehaviour
{
    NavMeshAgent agent;
    GameObject target;
    Animator anim;

    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        target = GameObject.Find("EnemyLoop (" + Random.Range(1, 12) + ")");
        anim = GetComponent<Animator>();
        StartCoroutine(ReachPoint());

    }

    // Update is called once per frame
    void Update()
    {
        if (Vector3.Distance(transform.position, target.transform.position) <= 1f)
        {
            StartCoroutine(ReachPoint());
        } 
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
