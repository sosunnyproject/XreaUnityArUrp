using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TouchMaterial : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;
    public Material matAfterTouch;
    public GameObject Cocoon;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }


    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            debugLog = "" + touch.phase;
            Cocoon.GetComponent<Renderer>().material = matAfterTouch;
        }
    }
}
