using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AniCin : MonoBehaviour
{
    public Animator _anmator;

    public Rigidbody rBody;


    private void OnGUI() { 
        if (GUI.Button(new Rect(0,0,100,50), "test")) {
            
                bool flag = _anmator.GetBool("flag");

            Debug.Log("test - " + flag.ToString());
            
            _anmator.SetBool("flag", !flag);

        }
    }
    // Start is called before the first frame update
    void Start() {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
