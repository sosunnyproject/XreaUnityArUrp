using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject scene_0;
    public GameObject scene_1_1;
    public GameObject scene_1_2;
    public GameObject scene_1;
    public GameObject scene_2_pre;
   // public GameObject scene_2;
    public GameObject TopButtons;
    public GameObject Scene1EventSystem;
    public GameObject Scene1Canvas;
    public GameObject Scene1Camera;

    void Start()
    {
        
    }

    public void scene_0_EnterButtonClick()
    {
        Debug.Log("Enter Clicked");
        scene_1.SetActive(true);
        scene_0.SetActive(false);
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
        Debug.Log("GoTo Next Scene: 2");
        scene_2_pre.SetActive(false);
        TopButtons.SetActive(false);
        Scene1Camera.SetActive(false);
        Scene1Canvas.SetActive(false);
        Scene1EventSystem.SetActive(false);
        SceneManager.LoadScene("AllScenes", LoadSceneMode.Additive);
    }
  

    // Update is called once per frame
}
