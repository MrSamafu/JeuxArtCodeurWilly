using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CloneDestroy : MonoBehaviour
{
    public float timer = 4f;
    void Start()
    {
        Destroy(gameObject, timer);
    }
}
