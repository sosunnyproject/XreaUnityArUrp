using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject scene_1_1;
    public GameObject scene_1_2;
    public GameObject scene_1;
    public GameObject scene_2_pre;
    public GameObject scene_2;

    void Start()
    {
        
    }

    public void scene_1_OkButtonOnClick()
    {
        Debug.Log("OK Clicked");
        scene_1_1.SetActive(true);
        scene_1.SetActive(false);
    }

    public void scene_1_NoButtonOnClick()
    {
        Debug.Log("NO Clicked");
        scene_1_2.SetActive(true);
        scene_1.SetActive(false);
    }
    public void scene_1_1_OkButtonOnClick()
    {
        Debug.Log("Open scene_2_pre");
        scene_2_pre.SetActive(true);
        scene_1_1.SetActive(false);
    }
    public void scene_1_2_BackHomeButtonOnClick()
    {
        Debug.Log("Back to Home");
        scene_1.SetActive(true);
        scene_1_2.SetActive(false);
    }
    public void scene_2_StartButtonOnClick()
    {
        Debug.Log("Open scene_2");
        scene_2.SetActive(true);
        scene_2_pre.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
