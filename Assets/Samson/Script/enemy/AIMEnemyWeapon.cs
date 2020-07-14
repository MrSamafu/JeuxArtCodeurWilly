using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIMEnemyWeapon : MonoBehaviour
{
    public GameObject target;

    private void Update()
    {
        transform.LookAt(target.transform.position);
    }
}
