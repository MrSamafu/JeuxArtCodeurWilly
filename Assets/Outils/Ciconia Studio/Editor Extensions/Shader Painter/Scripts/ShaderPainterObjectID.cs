#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System.Collections;
using CiconiaStudioShaderPainter;

namespace CiconiaStudioShaderPainter
{

    [ExecuteInEditMode]
    public class ShaderPainterObjectID : MonoBehaviour
    {
        public int[] id;
        public string[] matNames;

        public void init()
        {
            if (!gameObject.GetComponent<ShaderPainterSaveID>())
            {
                ShaderPainterSaveID spsi = gameObject.AddComponent<ShaderPainterSaveID>();
                spsi.id = id;
                spsi.matNames = matNames;
            }

            DestroyImmediate(this);
            
        }

        void Start()
        {
            init();
        }

        void Update()
        {
            init();
        }
      


    }

}
#endif