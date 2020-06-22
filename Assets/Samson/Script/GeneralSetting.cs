using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GeneralSetting : MonoBehaviour
{
    public static int life, bullets;
    private Text bulletText, lifeText;
    void Start()
    {
        lifeText = GameObject.Find("Life").GetComponent<Text>();
        bulletText = GameObject.Find("Bullets").GetComponent<Text>();
        life = 100;
        bullets = 15;
    }

    // Update is called once per frame
    void Update()
    {
        lifeText.text = "Life : " + life;
        bulletText.text = "Bullets : " + bullets;

        if( life <= 0)
        {
            life = 0;
        }
        if(bullets <= 0)
        {
            bullets = 0;
        }
    }
}
