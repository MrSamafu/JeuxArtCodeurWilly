using System.Collections;
using System.Collections.Generic;
using System.Linq.Expressions;
using UnityEngine;
using UnityEngine.AI;

public class enemyInteract : MonoBehaviour
{
    public Behaviour[] Target;
    private int countTarget = 0;
    EnemyMove enemyMove;
    private bool detect;
    NavMeshAgent agent;
    public Animator anim;
    GameObject target;
    public Transform body;
    public GameObject Gun;
    public float force = 0f;
    public GameObject Impact;
    public ParticleSystem muzzleFlash;
    private bool fire = true;
    public GameObject NPC;
    // Start is called before the first frame update
    void Start()
    {
        
        agent = GetComponentInParent<NavMeshAgent>();
        detect = false;
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
        if (detect)
        {
            if (Vector3.Distance(body.position, target.transform.position) >= 5f)
            {
                GoTo();
                Debug.DrawRay(body.position, body.forward, Color.red);
            }
            else
            {
                agent.isStopped = true;
                anim.SetBool("Walk", false);
                Debug.DrawRay(body.position, body.forward, Color.green);
                if (fire)
                {
                    fire = false;
                    StartCoroutine(PrepareToShoot(target.transform));
                }
                
                
            }
            

        }
        Debug.DrawRay(Gun.transform.position, Gun.transform.forward, Color.blue);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            for (int i = 0; i < countTarget; i++)
            {
                Target[i].enabled = true;
            }
            if (!detect)
            {
                target = other.gameObject;
                attack();
                detect = true;
                
            } 
                
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (!detect)
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
    public void attack()
    {
        enemyMove.enabled = false;
        agent.isStopped = true;
        anim.SetBool("Walk", false);
        
    }
    public void GoTo()
    {
        anim.SetBool("Walk", true);
        agent.isStopped = false;
        agent.SetDestination(target.transform.position);
    }
    public void Shoot()
    {
        RaycastHit hit;
        muzzleFlash.Play();
        if (Physics.Raycast(body.position, body.transform.forward, out hit, 150f))
        {
            Debug.Log(hit.transform.gameObject);

            
            if (hit.transform.tag == "Player")
            {
                GeneralSetting.life -= 10;
            }
            if (hit.rigidbody != null)
            {
                hit.rigidbody.AddForce(-hit.normal * force);
            }

        }
        GameObject impactGO = Instantiate(Impact, hit.point, Quaternion.LookRotation(hit.normal));
        Destroy(impactGO, 2f);
    }
    IEnumerator PrepareToShoot(Transform playerPosition)
    {
        NPC.transform.LookAt(playerPosition);
        yield return new WaitForSeconds(1f);
        Shoot();
        fire = true;
        
    }
}
