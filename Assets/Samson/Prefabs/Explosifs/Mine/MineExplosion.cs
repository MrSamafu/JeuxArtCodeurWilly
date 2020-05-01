using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MineExplosion : MonoBehaviour
{
    public float time = 1f;
    public int force;
    public GameObject particle;
    private Rigidbody rb;

    private void Start()
    {
        rb = GetComponent<Rigidbody>();
    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Player")
        {
            StartCoroutine(explosion());
        }
    }

    IEnumerator explosion()
    {
        rb.isKinematic = false;
        rb.AddForce(transform.TransformDirection(Vector3.up) * force);
        yield return new WaitForSeconds(time);
        Destroy(gameObject);

        
    }
}
